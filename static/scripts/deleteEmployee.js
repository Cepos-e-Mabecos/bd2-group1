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
        button.classList = "btn btn-danger mx-auto d-block details";
        button.innerHTML = "Delete Employee";
        /*Set attributes to allow that button to open the modal*/
        td.appendChild(button);
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
    /*For each button create an event to trigger the getRestaurant() funtion that will handle the get resquest of that restaurant */
    document.querySelectorAll(".details").forEach(element => {
        element.addEventListener("click", () => {
            deleteEmployee(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function deleteEmployee(id){
    fetch("http://localhost:5001/employee/" + id, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then((res) => {
        res.json();
        window.location.href = "http://localhost:5000/deleteEmployee";
    });
}


