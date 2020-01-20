/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/employee/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        let button = document.createElement("button");
        innerHTML= `  <th scope="row">${element.Employee_Cod}</th>
                <td>${element.Employee_FirstName}</td>
                <td>${element.Employee_LastName}</td>
                `;
        button.id=element.Employee_Cod;
        button.classList = "btn btn-primary mx-auto d-block details";
        button.innerHTML = "Edit Employee";
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
           getEmployee(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function getEmployee(id){
    /*fetch function to access the API, in that case a GET request with an ID associate */
    const response = await fetch('http://localhost:5001/employee/'+id);
    let data = await response.json();
  
    data = data["Record"][0][0];
    console.log(data);
    /*Put information of the restaurant in the modal */
    document.querySelector("#idEmployee").value= data.Employee_Cod;
    document.querySelector('#firstName').value = data.Employee_FirstName;
    document.querySelector('#lastName').value = data.Employee_LastName;
}

document.querySelector("#submit-button").addEventListener('click', ()=>{
    let idEmployee = document.querySelector("#idEmployee").value;
    fetch("http://localhost:5001/employee/" + idEmployee, {
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
        window.location.href = "http://localhost:5000/updateEmployee";
    });
});
