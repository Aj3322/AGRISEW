import requests
from bs4 import BeautifulSoup

def flipkart_scrape(query):
    # Flipkart search URL for the query
    url = f"https://www.flipkart.com/search?q={query.replace(' ', '%20')}"
    
    # Add headers to mimic a browser request
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    }
    
    # Send GET request
    response = requests.get(url, headers=headers)
    
    # Parse the page content
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # Find all product containers
    product_containers = soup.find_all('div', {'class': '_1AtVbE'})
    
    products = []
    
    for container in product_containers:
        # Extract product name
        name = container.find('div', {'class': '_4rR01T'})
        if not name:
            continue
        name = name.text.strip()
        
        # Extract price
        price = container.find('div', {'class': '_30jeq3 _1_WHN1'})
        if price:
            price = price.text.strip()
        
        # Extract rating
        rating = container.find('div', {'class': '_3LWZlK'})
        if rating:
            rating = rating.text.strip()
        
        # Append the product information to the list
        products.append({
            'name': name,
            'price': price,
            'rating': rating,
        })
    
    return products

if __name__ == "__main__":
    search_query = input("Enter the product to search on Flipkart: ")
    scraped_data = flipkart_scrape(search_query)
    
    for index, product in enumerate(scraped_data, start=1):
        print(f"{index}. {product['name']}")
        print(f"   Price: {product['price']}")
        print(f"   Rating: {product['rating']}\n")
