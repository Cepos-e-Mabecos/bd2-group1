const apiRequest = () => {
    const getRestaurants = async () => {
        const response = await fetch('http://localhost:5000/api/restaurant');
        const data = await response.json();
        let innerHTML = ' ';
        
        data.forEach((element) => {
            innerHTML += `<div class="card">
                            ${element.name}
                            ${element.location}
                        </div>`;
        });
        /* pass the data from the file to the UI */
        document.querySelector('.teste-container').innerHTML = innerHTML;
    }
    return {
        getRestaurants: getRestaurants
    }
}

document.querySelector('body').addEventListener('click',apiRequest().getRestaurants);
