/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/client/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        let button = document.createElement("button");
        innerHTML= `  <th scope="row">${element.Client_Nif}</th>
        <td>${element.Client_FirstName}</td>
        <td>${element.Client_LastName}</td>
        `;
        button.id=element.Client_Nif;
        button.classList = "btn btn-primary mx-auto d-block details";
        button.innerHTML = "Edit Client";
        /*Set attributes to allow that button to open the modal*/
        button.setAttribute('data-toggle','modal');
        button.setAttribute('data-target','#exampleModal');
        td.appendChild(button);
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
    /*For each button create an event to trigger the getRestaurant() funtion that will handle the get resquest of that restaurant */
    document.querySelectorAll(".details").forEach(element => {
        element.addEventListener("click", () => {
           getClient(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function getClient(id){
    /*fetch function to access the API, in that case a GET request with an ID associate */
    const response = await fetch('http://localhost:5001/client/'+id);
    let data = await response.json();
  
    data = data["Record"][0][0];
    console.log(data);
    /*Put information of the restaurant in the modal */
    document.querySelector("#nifClient").value= data.Client_Nif;
    document.querySelector('#firstName').value = data.Client_FirstName;
    document.querySelector('#lastName').value = data.Client_LastName;
}

document.querySelector("#submit-button").addEventListener('click', ()=>{
    let idEmployee = document.querySelector("#nifClient").value;
    fetch("http://localhost:5001/client/" + idEmployee, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
                first_name: document.querySelector('#firstName').value,
                last_name: document.querySelector('#lastName').value
        })
    })
    .then((res) => {
        res.json();
        window.location.href = "http://localhost:5000/updateClient";
    });
});
