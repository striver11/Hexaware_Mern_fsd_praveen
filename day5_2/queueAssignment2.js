const { Queue } = require('@datastructures-js/queue');

class CustomerRequest {
    constructor(name, id, contactNumber, description, dateTime) {
        this.name = name;
        this.id = id;
        this.contactNumber = contactNumber;
        this.description = description;
        this.dateTime = dateTime;
    }

    toString() {
        return `${this.name} (${this.id}): ${this.description} [${this.dateTime}]`;
    }
}

// Create a new queue
let customerQueue = new Queue();

// Add customer requests to the queue
let customers = [
    new CustomerRequest("Aarav", 1, "123-456-7890", "Need help with order", new Date()),
    new CustomerRequest("Vivaan", 2, "234-567-8901", "Unable to login to my account", new Date()),
    new CustomerRequest("Aditya", 3, "345-678-9012", "Payment issue", new Date()),
    new CustomerRequest("Arjun", 4, "456-789-0123", "Delivery is delayed", new Date()),
    new CustomerRequest("Ananya", 5, "567-890-1234", "Received a wrong product", new Date())
];

for (let customer of customers) {
    customerQueue.enqueue(customer);
}

// Display the queue
console.log("=================================display queue")
console.log(customerQueue.toArray());

// Remove a request from the queue
console.log("=================================remove request")
console.log(customerQueue.dequeue());

// Display the queue
console.log("=================================display updated queue")
console.log(customerQueue.toArray());
