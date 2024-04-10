function validateVehicleRegistrationNumber(registrationNumber) {
    const vehicleRegEx = /^[A-Z]{2}\d{1,2}[A-Z]{1,2}\d{4}$/;
    return vehicleRegEx.test(registrationNumber);
}

function getStateFromRegistrationNumber(registrationNumber) {
    const stateCodes = {
        "AN": "Andaman and Nicobar Islands",
        "AP": "Andhra Pradesh",
        "AR": "Arunachal Pradesh",
        "AS": "Assam",
        "BR": "Bihar",
        "CG": "Chhattisgarh",
        "CH": "Chandigarh",
        "DD": "Daman and Diu",
        "DL": "Delhi",
        "DN": "Dadra and Nagar Haveli",
        "GA": "Goa",
        "GJ": "Gujarat",
        "HP": "Himachal Pradesh",
        "HR": "Haryana",
        "JH": "Jharkhand",
        "JK": "Jammu and Kashmir",
        "KA": "Karnataka",
        "KL": "Kerala",
        "LD": "Lakshadweep",
        "MH": "Maharashtra",
        "ML": "Meghalaya",
        "MN": "Manipur",
        "MP": "Madhya Pradesh",
        "MZ": "Mizoram",
        "NL": "Nagaland",
        "OD": "Odisha",
        "PB": "Punjab",
        "PY": "Puducherry",
        "RJ": "Rajasthan",
        "SK": "Sikkim",
        "TG": "Telangana",
        "TN": "Tamil Nadu",
        "TR": "Tripura",
        "TS": "Telangana",
        "UK": "Uttarakhand",
        "UP": "Uttar Pradesh",
        "WB": "West Bengal"
    };

    const stateCode = registrationNumber.substr(0, 2);
    return stateCodes[stateCode] || "Unknown State";
}


const registrationNumber = "TS10AB1234";  
if (validateVehicleRegistrationNumber(registrationNumber)) {
    const state = getStateFromRegistrationNumber(registrationNumber);
    console.log(`The vehicle belongs to ${state}.`);
} else {
    console.log("Invalid registration number.");
}

