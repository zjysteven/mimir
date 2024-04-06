export MIMIR_CACHE_PATH="cache"
export MIMIR_DATA_SOURCE="data"

DEVICE='4'
NGRAM="13_0.8"

for MODEL in 'EleutherAI/pythia-160m' 'EleutherAI/pythia-1.4b' 'EleutherAI/pythia-2.8b' 'EleutherAI/pythia-6.9b' 'EleutherAI/pythia-12b'; do
    for DATA in "arxiv" "dm_mathematics" "hackernews" "github" "pile_cc" "pubmed_central" "wikipedia_(en)"; do
        CUDA_VISIBLE_DEVICES=${DEVICE} \
        python run.py \
            --config configs/mi.json \
            --experiment_name ${DATA}_${NGRAM} \
            --dataset_member ${DATA}_ngram_${NGRAM} \
            --dataset_nonmember ${DATA}_ngram_${NGRAM} \
            --base_model ${MODEL}
    done
done