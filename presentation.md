Course Project: Data Science Capstone - Next Word Prediction
========================================================
author: Bern Reyes
date: 2/11/18
autosize: true

Overview
========================================================

The goal of this project is to create a Shiny application to predict the next
word given the entered word or phrase by the user. This project is proposed by Johns Hopkins University in partnership with Swiftkey. The data used to make the prediction is from the Corpora of blogs, news and tweets.




Process
========================================================

Subsets of each data of blogs, news, and tweets were used and combined the to create a sampled data. The data was cleaned by converting to lowercase, removing punctuations and numbers, and white spaces. Then, it was tokenized into n-grams such as bigram, trigram, and quadgram. The combination of words from n-grams were counted and the most common combination of words will serve as the initial reference of which word is most likely to be next after the entered word.



Prediction
========================================================

The entered words or phrases by the user are counted to know which n-gram to use. If there is one word in the data entry, bigram will be used while trigram will be used if there are two words. For at least three words, quadgram will be used, but if not matched in any records in quadgram, trigram or bigram will be used.



Shiny Application
========================================================
The Shiny Application is located here: https://breyes0409.shinyapps.io/nextwordprediction/

The user will enter the desired word or phrase in the left side. Then, the predicted next word will be presented on the right side.

![application](snapshot.png)


