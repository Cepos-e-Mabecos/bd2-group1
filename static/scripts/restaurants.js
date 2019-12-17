count = 0;
document.querySelector("#add-comsumption").addEventListener('click', () => {
    if (count < 4) {
        var newcontent = document.createElement('input');
        newcontent.classList = 'form-control comsuption-input';
        // let innerHTML =`<input type="text" class="form-control" id="comsuption-${count}" placeholder="Name of Restaurant">`;
        document.querySelector('.comsumption-zone').appendChild(newcontent);
    }
    count++;
});


// const apiRequest = () => {
//     const getRestaurants = async () => {
//         const response = await fetch('http://localhost:5001/restaurant');
//         const data = await response.json();
//         let innerHTML = ' ';

//         data.forEach((element) => {
//             innerHTML += `<div class="card">
//                             ${element.name}
//                             ${element.location}
//                         </div>`;
//         });
//         /* pass the data from the file to the UI */
//         document.querySelector('.teste-container').innerHTML = innerHTML;
//     };
//     return {
//         getRestaurants: getRestaurants
//     }
// }

// document.querySelector('body').addEventListener('click',apiRequest().getRestaurants);
