# 🏡 Find your dream home outside the city 🏡
IronHack DataAnalytics BootCamp Final Project, by Marta Marti, July 2021

## Content

- [Project Brief](#project-brief)
- [Finding and processing the data](#finding-and-processing-the-data)
- [Data Cleaning](#data-cleaning )

## Project Brief

__Scenario__: After the pandemic, many considered moving outside the cities looking for a greaner environment, a place where to live in contact with nature. In this project I want to show users which housing options outside town can they afford also adding the renovation price to the final calculation, so they can make sure it will be their dream home.

__Challenge__: Scrapping and cleaning the data from a website had been the major issue.
You can follow the evolution of the project's workflow in [my board in Trello.](https://trello.com/b/4OnE95KR/ironhack-final-project)

__Results__: The main brief of this project is reflected on the original storytelling I created [in Medium](https://martamartidausa.medium.com/and-with-covid-between-us-who-doesnt-want-to-have-a-garden-81cab88e28ac) that can bring you inside the project's use. 
Also, see my [class presentation.](https://docs.google.com/presentation/d/1X7bsca3wnFJv7AvcrR5nxuRQXGou_5He9GYLCsOR5ic/edit#slide=id.p)

Some more info about how everything worked:

## Finding and processing the data 

This project has been developped with data scrapped from the site [Habitaclea.com](link here](https://www.habitaclia.com/viviendas-en-valles_oriental.htm), limiting the search in the Valles Oriental area (50km far from Barcelona city center, known by its green surroundings and hicking paths options).

__Tasks__: I have worked on the Scrapping process of the site, extracting 3 main groups of data:

1. Listing profile's url.
2. Propertie's dimension (squared footage).
3. Price property.

Below, some example of the code used:

```listings_soups=[]

for href in alllinks:
    # send request
    url="https://www.habitaclia.com/viviendas-en-valles_oriental.htm"
    response=requests.get(url)
    print("status=" + str(response.status_code))
    # parse & store html
    soup=BeautifulSoup(response.content, "html.parser")
    listings_soups.append(soup.select('h3'))
    # respectful nap:
    wait_time=randint(1,2)
    print("I will sleep now for..."+str(wait_time)+"secs")
    sleep(wait_time)
    
#Price
listings_soups.find(soup.find_all('span',class_="font-2"))

#Sqm
listings_soups.find(soup.find_all('p', class_="list-item-feature"))


#Collect with a loop - listing link, their price and sqm: 
link=[]
price=[]
sqm=[]

for href in listings_soups:
    link.append(href.find(soup.select('h3')))
    price.append(soup.find_all('span',class_="font-2"))
    sqm.append(href.find('p', class_="list-item-feature"))
  ```

__Challenge__:The site was scrappable, that was very positive! But the html code has been hard to split to get the information needed...

__Learnings/Conclusions__: As a conclusion I would like to reinforce how much I learned! And how challenging web scrapping is if you have such limited ammount of time. But it has been a great project to close this BootCamp with.


## Data Cleaning  

__Tasks__: From every peace of data scrapped I has to extract the information I needed.

__Challenge__: Finding the right code to extract the data, which finally has turned up to be RegEx.

__Learnings/Conclusions__: the most difficult part of this data cleaning has been finding the right code to extract the data from random strings in different cells. Finding the right RegEx and execute it properly to be more specciffic. (See example of code below:)

Thanks for reading!
