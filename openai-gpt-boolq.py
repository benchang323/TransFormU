from openai import OpenAI
from datasets import load_dataset
import random

random.seed(42)
client = OpenAI()

dataset = load_dataset("boolq")
train_dataset = dataset["train"].shuffle(seed=42)
validation_dataset = dataset["validation"].shuffle(seed=42)


def select_balanced_demonstrations(shuffled_dataset, num_each=4):
    yes_examples = [ex for ex in shuffled_dataset if ex['answer']]
    no_examples = [ex for ex in shuffled_dataset if not ex['answer']]
    
    # Select 4 Yes cases and 4 No cases
    selected_yes = random.sample(yes_examples, num_each)
    selected_no = random.sample(no_examples, num_each)
    
    # Interleave yes and no examples
    demonstrations = [None]*(num_each*2)
    demonstrations[::2] = selected_yes
    demonstrations[1::2] = selected_no
    
    return demonstrations

# Use the shuffled `train_dataset` 
demonstrations = select_balanced_demonstrations(train_dataset, num_each=4)

def format_answer(answer):
    """Convert boolean answers to Yes/No."""
    return "Yes" if answer else "No"

def check_instance_structure(instance):
    return 'passage' in instance and 'question' in instance and 'answer' in instance

def create_prompt_with_demonstrations(demonstrations, new_question):
    prompt = "Given the following passages, questions, and answers:\n\n"
    for demo in demonstrations:
        if check_instance_structure(demo):
            prompt += f"Passage: {demo['passage']}\n"
            prompt += f"Question: {demo['question']}\n"
            prompt += f"Answer: {format_answer(demo['answer'])}\n\n"
    # Make the new question without an answer, so that the model can generate it
    prompt += f"New Passage: {new_question['passage']}\n"
    prompt += f"New Question: {new_question['question']}\n"
    prompt += "Answer:"
    return prompt

def ask_gpt(instance):
    if not check_instance_structure(instance):
        return "Error: Instance structure is incorrect."
    
    prompt = create_prompt_with_demonstrations(demonstrations, instance)
    response = client.completions.create(
        model="gpt-3.5-turbo-instruct",
        prompt=prompt,
        max_tokens=50,
        temperature=0.5
    )
    return response.choices[0].text.strip()

# Evaluate the model on 30 instances
evaluation_instances = validation_dataset.select(range(30)) 

# print("eval instances: ", evaluation_instances)
    
# Evaluate the model
correct_predictions = 0
for instance in evaluation_instances:
    print("instance: ", instance)
    predicted_answer = ask_gpt(instance) # Pass the entire instance
    print("predicted answer: ", predicted_answer)
    actual_answer = format_answer(instance['answer'])
    if predicted_answer.lower() == actual_answer.lower():
        correct_predictions += 1

accuracy = correct_predictions / len(evaluation_instances)
print(f"Accuracy: {accuracy}")