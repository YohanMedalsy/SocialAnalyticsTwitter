# The script MUST contain a function named azureml_main
# which is the entry point for this module.

# imports up here can be used to 
import pandas as pd

# The entry point function can contain up to two input arguments:
#   Param<dataframe1>: a pandas.DataFrame
#   Param<dataframe2>: a pandas.DataFrame
def azureml_main(dataframe1, dataframe2):

    df=dataframe1
    dfx=dataframe2
    df['retweets'] = dfx.filter(['retweets'], axis=1)
    df['hashtags'] = dfx.filter(['hashtags'], axis=1)
    df['followercount'] = dfx.filter(['Followercount'], axis=1)
    
    for col1 in df.columns:
        dfr=df.loc[(df[col1] < 0)]
        print(dfr)
    
    df=df.drop(['affect'], axis = 1)
    
    # Return value must be of a sequence of pandas.DataFrame
    return df,
