#!/bin/sh



if [ -z $OMPI_COMM_WORLD_RANK ]
then
	echo "OMPI_COMM_WORLD_RANK is not set. exiting"
	exit 1
fi


local_rank=$OMPI_COMM_WORLD_RANK

export RANK=$OMPI_COMM_WORLD_RANK
export WORLD_SIZE=$OMPI_COMM_WORLD_SIZE
export MASTER_ADDR=localhost
export MASTER_PORT=12345

python run_squad.py \
    --local_rank $local_rank \
    --model_type xlnet \
    --model_name_or_path xlnet-large-cased \
    --do_train \
    --do_eval \
    --version_2_with_negative \
    --train_file $SQUAD_DIR/train-v2.0.json \
    --predict_file $SQUAD_DIR/dev-v2.0.json \
    --learning_rate 3e-5 \
    --num_train_epochs 4 \
    --max_seq_length 384 \
    --doc_stride 128 \
    --output_dir ./wwm_cased_finetuned_squad/ \
    --per_gpu_eval_batch_size=2  \
    --per_gpu_train_batch_size=2   \
    --save_steps 5000
