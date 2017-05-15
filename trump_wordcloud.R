# Reading in data
trump <- Corpus(DirSource("/Users/ChrisV/Documents/Blog_files/trump_speeches-master/wordcloud/"))

# Cleaning and tokenizing text
trump_clean <- tm_map(trump, content_transformer(stripWhitespace))
trump_clean <- tm_map(trump_clean, content_transformer(tolower))
trump_clean <- tm_map(trump_clean, content_transformer(removePunctuation))
trump_clean <- tm_map(trump_clean, content_transformer(stemDocument))
trump_clean <- tm_map(trump_clean, removeWords, c(stopwords("english"),"applause","will","millions"))

# Saving figure to machine
png("wordcloud.png", width=1280,height=800)

# Creating wordcloud for figure
wordcloud(trump_clean, scale=c(4,0.7), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(9, "Set1"))

hillary <- Corpus(DirSource("/Users/ChrisV/Documents/Blog_files/hillaryspeech1/"))
hillary_clean <- tm_map(hillary, content_transformer(stripWhitespace))
hillary_clean <- tm_map(hillary_clean, content_transformer(tolower))
hillary_clean <- tm_map(hillary_clean, content_transformer(removePunctuation))
hillary_clean <- tm_map(hillary_clean, content_transformer(stemDocument))
hillary_clean <- tm_map(hillary_clean, removeWords, c(stopwords("english"),"applause","will","millions"))

wordcloud(hillary_clean, scale=c(3,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(9, "Set1"))

