#for j in {1,2,3}
##j=2
#do
FILE_PATH=../mlm_ner/dataset/ontonotes/ #dataset/conll/conll-5shot-new/
FILE_NAME=${FILE_PATH}train_setB.json
BERT_MODEL_PATH=./xxxxxxx

#for i in {1..3}
#do

echo "---------------------------------------Training with file ${FILE_NAME}, round $i----------------------------------------"
echo ""

#CUDA_VISIBLE_DEVICES=4 python3 run_ner_no_trainer.py \
#  --model_name_or_path ../pretrained/bert-base-cased \
#  --train_file $FILE_NAME \
#  --validation_file dataset/conll/test.json \
#  --output_dir models/test-conll-base2 \
#  --num_train_epochs 3 \
#  --learning_rate 5e-5 \ui=y
#  --per_device_train_batch_size 32 \
#  --label_list dataset/conll/labels.txt \
#  --return_entity_level_metrics \
#  --label_schema BIO \


CUDA_VISIBLE_DEVICES=4 python3 run_ner_no_trainer.py \
  --model_name_or_path $BERT_MODEL_PATH \
  --train_file $FILE_NAME \
  --validation_file ../mlm_ner/dataset/ontonotes/test_setB.json \
  --num_train_epochs 5 \
  --learning_rate 5e-5 \
  --per_device_train_batch_size 32 \
  --return_entity_level_metrics \
    --label_list ../mlm_ner/dataset/ontonotes/labels_setB.txt \
  --output_dir models/onto-setA-entlm-probeB \
  --label_schema BIO \
#  --label_all_tokens


#
#done
#done
