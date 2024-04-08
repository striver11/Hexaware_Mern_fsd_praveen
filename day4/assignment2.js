// Create an array of product objects and each product object should include the following properties.

// 		properties:		id, pname, price, qty,  category 
let products = [
    { id: 1, pname: "Phone", price: 500, qty: 10, category: "Electronics" },
    { id: 2, pname: "Saree", price: 50, qty: 5, category: "Clothes" },
    { id: 3, pname: "Sandals", price: 30, qty: 8, category: "Footwear" },
    { id: 4, pname: "Sneakers", price: 40, qty: 0, category: "Footwear" }
  ];
  
//   a.  display the product details based on the given product id	
  function displayProductById(productId) {
    let product = products.find(item => item.id === productId);
    if (product) {
      console.log("Product Details:", product);
    } else {
      console.log("Product not found");
    }
  }
  
//   b.  display the product names and unit price based on the given category
  function displayProductNamesAndPricesByCategory(category) {
    let filteredProducts = products.filter(item => item.category === category);
    if (filteredProducts.length > 0) {
      filteredProducts.forEach(item => {
        console.log("Product Name:", item.pname, "- Unit Price:", item.price);
      });
    } else {
      console.log("No products found for the given category");
    }
  }
  
//   c.   add new product to array 
  function addProduct(product) {
    products.push(product);
    console.log("New product added successfully");
  }
  
//   d.   delete the product based on the product id 
  function deleteProduct(productId) {
    let index = products.findIndex(item => item.id === productId);
    if (index !== -1) {
      products.splice(index, 1);
      console.log("Product deleted successfully");
    } else {
      console.log("Product not found");
    }
  }
  
//   e.   display the product details based on the range of price (min, max) 
  function displayProductsByPriceRange(minPrice, maxPrice) {
    let filteredProducts = products.filter(item => item.price >= minPrice && item.price <= maxPrice);
    if (filteredProducts.length > 0) {
      console.log("Products within the price range:");
      filteredProducts.forEach(item => {
        console.log(item);
      });
    } else {
      console.log("No products found within the given price range");
    }
  }
  
//   f.    display out of stock products  (i.e qty is zero)
  function displayOutOfStockProducts() {
    let outOfStockProducts = products.filter(item => item.qty === 0);
    if (outOfStockProducts.length > 0) {
      console.log("Out of Stock Products:");
      outOfStockProducts.forEach(item => {
        console.log(item);
      });
    } else {
      console.log("No out of stock products found");
    }
  }
  
//   g.   perform sorting the array based on the price 
  function sortProductsByPrice() {
    products.sort((a, b) => a.price - b.price);
    console.log("Products sorted by price:", products);
  }
  
  // Test cases
  console.log("Display product details based on product id:");
  displayProductById(2);
  console.log("\nDisplay product names and unit prices based on category:");
  displayProductNamesAndPricesByCategory("Electronics");
  console.log("\nAdd new product to array:");
  addProduct({ id: 4, pname: "Laptop", price: 800, qty: 15, category: "Electronics" });
  console.log("\nDelete product based on product id:");
  deleteProduct(3);
  console.log("\nDisplay product details based on price range:");
  displayProductsByPriceRange(30, 100);
  console.log("\nDisplay out of stock products:");
  displayOutOfStockProducts();
  console.log("\nSort products based on price:");
  sortProductsByPrice();
  