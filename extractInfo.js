import { GoogleGenerativeAI } from "@google/generative-ai";

// Example of extracting job data from the page
function extractJobData() {
    let jobRelated = document.querySelectorAll('[class*="job"]')

    // jobRelated.forEach((node, index) => {
    //     console.log(`Node ${index}:`, node.textContent);
    // });
    
    return 0;
}

// // Run the extraction process
let jobData = extractJobData();
// if (jobData.title && jobData.company) {
//     saveJobData(jobData);
// }
