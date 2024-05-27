#!/bin/bash

#SBATCH --partition=mig_class
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=4:00:0
#SBATCH --job-name="CS 601.471/671 homework5"
#SBATCH --output=slurm-%j.out
#SBATCH --mem=32G
#SBATCH --mail-user=asandhu9@jhu.edu
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END

source ~/.bashrc
conda activate ssm_hw5 # activate the Python environment

# 3.1.1 (Small - Local)
# echo "python base_classification.py --small_subset --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 30 "
# python base_classification.py --small_subset --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 30 

# 3.1.2 (Increase Batch Size)
# echo "python base_classification.py  --device cuda --model "distilbert-base-uncased" --batch_size "128" --lr 1e-4 --num_epochs 30"
# python base_classification.py  --device cuda --model "distilbert-base-uncased" --batch_size "128" --lr 1e-4 --num_epochs 30

# 3.1.3 (Learning Rates / Epochs) 
# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 7"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 7 

# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 9"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-4 --num_epochs 9

# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 5e-4 --num_epochs 7"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 5e-4 --num_epochs 7 

# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 5e-4 --num_epochs 9"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 5e-4 --num_epochs 9 

# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-3 --num_epochs 7"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-3 --num_epochs 7 

# echo "python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-3 --num_epochs 9"
# python base_classification.py --device cuda --model "distilbert-base-uncased" --batch_size "64" --lr 1e-3 --num_epochs 9 

# 3.1.4 (Compare Two Models) 
# echo "python base_classification.py --device cuda --model "BERT-base-cased" --batch_size "64" --lr 1e-4 --num_epochs 20"
# python base_classification.py --device cuda --model "BERT-base-cased" --batch_size "64" --lr 1e-4 --num_epochs 20 

# echo "python base_classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 20"
# python base_classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 20 

# 3.2.1 (type = full - in code) 
# echo "python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "full""
# python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "full"

# 3.2.2 (type = head - in code) 
# echo "python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "head""
# python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "head"

# 3.2.3 (type = prefix - in code) 
# echo "python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "prefix""
# python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 5 --type "prefix"

# 3.3.4
# echo "python classification.py --device cuda --model "RoBERTa-base" --batch_size "64" --lr 1e-4 --num_epochs 20"
# python classification.py --device cuda --model "RoBERTa-base"

# 3.2.6
echo "python classification_lora.py --device cuda --model "RoBERTa-base" --batch_size "32" --lr 1e-4 --num_epochs 5"
python classification_lora.py --device cuda --model "RoBERTa-base" --batch_size "32" --lr 1e-4 --num_epochs 10
