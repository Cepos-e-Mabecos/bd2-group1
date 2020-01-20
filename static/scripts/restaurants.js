/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/local/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        innerHTML += ` <option value="${element.Local_Cod}">${element.Local_Designation}</option>`;
    });
    document.querySelector('#local-input').innerHTML= innerHTML;
});   

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
/*When submit button is pressed the fetch function will be triggered */
document.querySelector('#submit-button').addEventListener('click', (event) => {
    event.preventDefault();
    let localsArray = new Array();
    let localsInput = document.querySelectorAll('.comsuption-input');
    let j;
    for (let i = 0; i < localsInput.length; i++) {
        localsArray.push(localsInput[i].value);
    }
    let restaurantID;
    fetch("http://localhost:5001/restaurant/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            designation: document.querySelector('#name-input').value,
            local_cod: document.querySelector('#local-input').value
        })
    })
        .then((res) => res.json())
        .then((data) => {
            restaurantID = data.Restaurant_Cod;
            for (j = 0; j < localsArray.length; j++) {
                fetch("http://localhost:5001/zone/", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        restaurant_cod: restaurantID[0],
                        designation: localsArray[j]
                    })
                })
                .then((res) => res.json());
            }
        })
        .then(() => {
            alert("Restaurante inserido com sucesso!");
            window.location.href = "http://localhost:5000/readRestaurant";
            
        });
        // .catch((err) => console.log(err));
});


