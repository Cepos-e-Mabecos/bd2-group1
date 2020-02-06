/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/client/');
    /*Transform the response to JSON */
    let data = await response.json();
    console.log(data);
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        innerHTML= `  <th scope="row">${element.Client_Nif}</th>
                <td>${element.Client_FirstName}</td>
                <td>${element.Client_LastName}</td>
                `;
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
});   