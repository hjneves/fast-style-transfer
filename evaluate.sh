if [ "$1" != "" ]; then
    FLOYD_JOB=$1
else
    echo "Sintax evaluate.sh floydjob"
    exit 1
fi


floyd run --env tensorflow-0.12:py2 \
  --data $FLOYD_JOB/:input "python evaluate.py \
  --allow-different-dimensions  \
  --checkpoint /input/checkpoints/fns.ckpt \
  --in-path ./images/ \
  --batch-size 1 \
  --out-path ./output/"