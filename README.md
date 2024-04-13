## Google Play Store Analysis using R

### Project Description:
This project aimed to segment Google Play Store applications into meaningful clusters to understand patterns in app popularity, user engagement, and monetization strategies. Leveraging unsupervised learning techniques, particularly K-Means clustering, I categorized apps into distinct groups based on their characteristics. The project also included comprehensive data cleaning, feature engineering, and visualizations to gain insights into the mobile app market dynamics.

### Data Description:
The dataset utilized in this project was the googleplaystore.csv dataset, which encapsulates details of mobile applications available on the Google Play Store. The following attributes were included:

- **App**: Name of the application.
- **Category**: Category under which the app is listed.
- **Rating**: Overall user rating of the app.
- **Reviews**: Number of user reviews for the app.
- **Size**: Size of the app.
- **Installs**: Number of user downloads/installs.
- **Type**: Paid or Free.
- **Price**: Price of the app (for paid apps).
- **Content Rating**: Age group the app is targeted at - Children / Mature 21+ / Adult.
- **Genres**: Genre of the app.
- **Last Updated**: Date when the app was last updated on Play Store.
- **Current Version**: Current version of the app available on Play Store.
- **Android Version**: Min required Android version.

### Tasks Performed:

- **Data Cleaning**: Preprocessed the data by handling missing values, converting string representations of numbers into numeric data types, and standardizing the 'Size' column to a consistent unit.
  
- **Feature Engineering**: Extracted year and month from 'Last Updated' to facilitate temporal analysis. Categorized 'Price' into a binary 'Free' or 'Paid' variable. Binned 'Installs' into categorized ranges to simplify the analysis of app popularity.

- **Unsupervised Learning - Clustering**: Utilized the K-Means algorithm to partition the apps into clusters based on features such as 'Rating', 'Reviews', and 'Installs'. Standardized these features before clustering to scale the variables and improve the algorithm's performance.

- **Visualization**: Developed several visualizations including:
    - A pie chart to demonstrate the distribution of clusters.
    - Scatter plots to illustrate the relationship between 'Rating' and 'Reviews', as well as 'Rating' and 'Installs', with each cluster presented in a unique color.

- **EDA (Exploratory Data Analysis)**: Performed EDA to understand the trends within each cluster, exploring factors that might influence an app's rating and popularity.

- **Interpretation**: Identified key characteristics of each cluster, providing insights into what factors might contribute to an app's success on the Google Play Store.

The project was performed in R. Find the code, visualisations and the dataset attached to this repository. 
