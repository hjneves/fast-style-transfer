if [ "$1" != "" ]; then
    MODEL=$1
else
    MODEL="wave.ckpt"
fi

floyd run --env tensorflow-0.12:py2 \
--data narenst/datasets/neural-style-transfer-pre-trained-models/1:models "python evaluate.py \
--allow-different-dimensions  \
--checkpoint /models/$MODEL \
--in-path ./images/ \
--out-path ./output/"

