// Define flight details using a Map
const flightDetails = new Map([
    ['AR456', { source: 'Hyderabad', destination: 'Bangalore', date: '2024-04-11', time: '18:00' }],
    ['XY789', { source: 'Mumbai', destination: 'Delhi', date: '2024-04-11', time: '20:00' }],
    ['AB123', { source: 'Chennai', destination: 'Kolkata', date: '2024-04-12', time: '10:00' }]
]);

// Function to get the status of a flight
function getFlightStatus(flightNumber) {
    if (flightDetails.has(flightNumber)) {
        const flight = flightDetails.get(flightNumber);
        const currentDateTime = new Date();
        const flightDateTime = new Date(`${flight.date} ${flight.time}`);

        if (currentDateTime > flightDateTime) {
            return `The Flight ${flightNumber} has already left from ${flight.source} to ${flight.destination}.`;
        } else {
            return `The Flight ${flightNumber} is leaving at ${flight.time} from ${flight.source} to ${flight.destination}.`;
        }
    } else {
        return `Invalid flight number: ${flightNumber}.`;
    }
}
    

const flightNumber = 'AR456';
console.log(getFlightStatus(flightNumber));
