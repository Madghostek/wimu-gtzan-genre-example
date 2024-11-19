# download index files, remove broken file
mkdir -p data/raw/gtzan_genre/genres
mkdir models
wget https://raw.githubusercontent.com/coreyker/dnn-mgr/master/gtzan/train_filtered.txt -O data/raw/gtzan_genre/train_filtered.txt
wget https://raw.githubusercontent.com/coreyker/dnn-mgr/master/gtzan/valid_filtered.txt -O data/raw/gtzan_genre/valid_filtered.txt
wget https://raw.githubusercontent.com/coreyker/dnn-mgr/master/gtzan/test_filtered.txt -O data/raw/gtzan_genre/test_filtered.txt
sed -i '/jazz\/jazz.00054.wav/d' data/raw/gtzan_genre/train_filtered.txt

# download the dataset, move to proper location
wget https://www.kaggle.com/api/v1/datasets/download/andradaolteanu/gtzan-dataset-music-genre-classification -O gtzan.zip
unzip gtzan.zip
mv Data/genres_original/* data/raw/gtzan_genre/genres

# remove broken file from storage if needed
#rm data/raw/gtzan_genre/genres/jazz/jazz.00054.wav

# cleanup
rm gtzan.zip
rm -r Data
