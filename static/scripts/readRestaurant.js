window.addEventListener("load", async () => {
    const response = await fetch('http://localhost:5001/restaurant/');
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        let button = document.createElement("button");
        innerHTML= `  <th scope="row">${element.Restaurant_Cod}</th>
                <td>${element.Restaurant_Designation}</td>
                <td>${element.Restaurant_Local}</td>
                `;
        button.id=element.Restaurant_Cod;
        button.classList = "btn btn-primary mx-auto d-block details";
        button.innerHTML = "View Details"
        td.appendChild(button);
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
    document.querySelectorAll(".details").forEach(element => {
        element.addEventListener("click", () => {
           getRestaurant(element.id);
        });
    });
});   

async function getRestaurant(id){
    const response = await fetch('http://localhost:5001/restaurant/'+id);
    let data = await response.json();
    data = data["Record"][0][0];
    console.log(data);
}
 

