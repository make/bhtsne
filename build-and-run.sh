CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
g++ sptree.cpp tsne.cpp -o bh_tsne -O2 -fopenmp
mkdir $CURRENT_BRANCH
cp bh_tsne bhtsne.py $CURRENT_BRANCH
cd $CURRENT_BRANCH
./bhtsne.py -i $1 --init $2 -n 200 -o output.csv -m 10000 -v --stop_lying_iter 250 --lying_factor 12.0 --momentum_switch_iter 250 --start_momentum 0.5 --final_momentum 0.8 --iter_data_dir ../iters_$CURRENT_BRANCH
