const { Queue } = require('@datastructures-js/queue');

class BrowserHistoryEntry {
    constructor(url, dateTime) {
        this.url = url;
        this.dateTime = dateTime;
    }
}

// Create a new queue for browser history
const browserHistory = new Queue();

// Function to add a new entry to the browser history
function addHistoryEntry(url) {
    const dateTime = new Date().toLocaleString();
    const entry = new BrowserHistoryEntry(url, dateTime);
    browserHistory.enqueue(entry);
}

// Function to remove the oldest entry from the browser history
function removeHistoryEntry() {
    return browserHistory.dequeue();
}

// Function to display the browser history
function displayHistory() {
    const historyArray = browserHistory.toArray();
    if (historyArray.length === 0) {
        console.log("Browser history is empty.");
    } else {
        console.log("Browser History:");
        historyArray.forEach((entry, index) => {
            console.log(`Entry ${index + 1}: ${entry.url} [${entry.dateTime}]`);
        });
    }
}

// Add some entries to the browser history
const browserEntries = [
    { url: "https://www.example.com", dateTime: new Date().toLocaleString() },
    { url: "https://www.google.com", dateTime: new Date().toLocaleString() },
    { url: "https://www.github.com", dateTime: new Date().toLocaleString() }
];

browserEntries.forEach(entry => {
    browserHistory.enqueue(entry);
});

console.log("==========================================Display the browser history");
displayHistory();


console.log("==========================================Remove an entry from the browser history");
const removedEntry = removeHistoryEntry();
if (removedEntry) {
    console.log("Removed Entry:", removedEntry.url);
}

console.log("==========================================Display updated browser history");
displayHistory();
