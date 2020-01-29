if [ "$1" != "" ]; then
    STYLE_IMAGE=$1
else
    echo "Sintax style.sh stylefile [nr iterations]"
    exit 1
fi

if [ "$2" != "" ]; then
    NR_ITERATIONS=$2
else
    NR_ITERATIONS=500
fi

floyd run --gpu --env tensorflow-0.12:py2 \
 --data narenst/datasets/coco-train-2014/1:images \
 --data narenst/datasets/neural-style-transfer-pre-trained-models/1:models \
 --data floydhub/datasets/imagenet-vgg-verydeep-19/3:vgg \
 "python style.py \
 --vgg-path /vgg/imagenet-vgg-verydeep-19.mat \
 --train-path /images/train2014 \
 --style style/$STYLE_IMAGE \
 --epoch 1 \
 --total-iterations $NR_ITERATIONS \
 --checkpoint-dir ./checkpoints"
