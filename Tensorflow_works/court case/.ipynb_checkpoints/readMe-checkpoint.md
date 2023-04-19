BERT
- I have to try using bert preprocessor before and train with it
see the result 
- then try creating my own preprocessor before passing it for training


`---------------------------------------------------------------------------------------------`
https://towardsdatascience.com/deep-learning-pipeline-for-natural-language-processing-nlp-c6f4074897bb

https://github.com/bauyrjanj/NLP-TwitterData
# Steps/Pipeline to NLP model building

##  Exploratory Data Analysis (Visualization)

- Number of words in each tweet
- Average length of word in a tweet
- Unigram
- Bigram
- Trigram
- Wordcloud



#### Convert tokens into format required for lemmatization
`from nltk.corpus import wordnet
def get_wordnet_pos(word):
    """Map POS tag to first character lemmatize() accepts"""
    tag = nltk.pos_tag([word])[0][1][0].upper()
    tag_dict = {"J": wordnet.ADJ,
                "N": wordnet.NOUN,
                "V": wordnet.VERB,
                "R": wordnet.ADV}
return tag_dict.get(tag, wordnet.NOUN)`
 Lemmatize tokens
`lemmatizer = WordNetLemmatizer()
tidy_tweets['lemmatized'] = tidy_tweets['text'].apply(lambda x: [lemmatizer.lemmatize(word, get_wordnet_pos(word)) for word in x])`
 Convert the lemmatized words back to the text format
`tidy_tweets['tokens_back_to_text'] = [' '.join(map(str, l)) for l in tidy_tweets['lemmatized']]`





### Training steps
- Tokenizing, padding and sequencing the dataset
- Balance the dataset with SMOTE
- Split the dataset into training and test sets
- Train SimpleRNN and LSTM models
- Evaluate models


####5.1 Tokenize, pad and sequence the dataset
prepare tokenizer 
`tokenizer = Tokenizer() tokenizer.fit_on_texts(tweets)`
 integer encode the documents
`sequences = tokenizer.texts_to_sequences(tweets)`
 pad documents to a max length of 14 words 
`maxlen = 14`
`X = pad_sequences(sequences, maxlen=maxlen)`

#### 5.2 Balance the imbalanced data with SMOTE
`from imblearn.over_sampling import SMOTE`
`from imblearn.under_sampling import RandomUnderSampler`
`from imblearn.pipeline import Pipeline`
 define pipeline
`over = SMOTE(sampling_strategy=0.5)
under = RandomUnderSampler(sampling_strategy=0.8)
steps = [('o', over), ('u', under)]
pipeline = Pipeline(steps=steps)`
transform the dataset
`X, y = pipeline.fit_resample(X, labels['label'])`
 One-hot encoding of labels
`from keras.utils.np_utils import to_categorical
y = to_categorical(y)`


5.3 Split the data into training and test sets

#### Split the dataset into train and test sets
`from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=43)`


#### SimpleRNN
`model = Sequential()
model.add(Embedding(input_dim = vocab_size, output_dim = output_dim, input_length = maxlen, embeddings_constraint=maxnorm(3)))
model.add(SimpleRNN(output_dim=output_dim, return_sequences=True, kernel_constraint=maxnorm(3)))
model.add(Dropout(0.2))
model.add(SimpleRNN(output_dim=output_dim, return_sequences=True, kernel_constraint=maxnorm(3)))
model.add(Dropout(0.2))
model.add(SimpleRNN(output_dim=output_dim))
model.add(Dense(2,activation='softmax'))`


#### LSTM
`model.add(Embedding(input_dim = vocab_size, output_dim = output_dim, input_length = maxlen, embeddings_constraint=maxnorm(3)))
model.add(LSTM(output_dim=output_dim, return_sequences=True, kernel_constraint=maxnorm(3)))
model.add(Dropout(0.2))
model.add(LSTM(output_dim=output_dim, return_sequences=True, kernel_constraint=maxnorm(3)))
model.add(Dropout(0.2))
model.add(LSTM(output_dim=output_dim, kernel_constraint=maxnorm(3)))
model.add(Dense(2,activation='softmax'))`




'------------------------------------------------------------------------------------`

https://www.turing.com/kb/natural-language-processing-function-in-ai
Image result for step in building nlp model with deep learning
The NLP pipeline comprises a set of steps to read and understand human language.
Step 1: Sentence segmentation. ...
Step 2: Word tokenization. ...
Step 3: Stemming. ...
Step 4: Lemmatization. ...
Step 5: Stop word analysis. ...
Step 6: Dependency parsing. ...
Step 7: Part-of-speech (POS) tagging.


- I need to change organised to organized in the dataset

