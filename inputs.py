# The script MUST contain a function named azureml_main
# which is the entry point for this module.

# imports up here can be used to 
import pandas as pd

# The entry point function can contain up to two input arguments:
#   Param<dataframe1>: a pandas.DataFrame
#   Param<dataframe2>: a pandas.DataFrame
def azureml_main(dataframe1, dataframe2):
    
    #From the Health and LIWC dataset, select the required columns
    df=dataframe1.filter(['infection', 'cause', 'study', 'news', 'organization', 'protect'], axis=1)
    df['affect']=dataframe2.filter(['affect'], axis=1)
    df['posemo']=dataframe2.filter(['posemo'], axis=1)
    df['negemo']=dataframe2.filter(['negemo'], axis=1)
    
    for col1 in df.columns:
        dfr=df.loc[(df[col1] < 0)]
        print(dfr)
    
    
    
    
    # Return value must be of a sequence of pandas.DataFrame
    return df,
