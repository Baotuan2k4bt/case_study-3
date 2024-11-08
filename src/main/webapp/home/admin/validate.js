document.addEventListener('DOMContentLoaded', function() {
    // Validate ID field
    const id = document.querySelector('input[name="id"]');
    id.addEventListener('input', function() {
        const idError = document.getElementById('idError');
        if (!id.value || id.value < 1) {
            idError.textContent = 'ID must be greater than 0.';
            idError.style.display = 'block';
        } else {
            idError.style.display = 'none';
        }
    });

    // Validate Name field
    const name = document.querySelector('input[name="name"]');
    const namePattern = /^[a-zA-Z0-9\s]+$/; // Only allows alphanumeric characters and spaces
    name.addEventListener('input', function() {
        const nameError = document.getElementById('nameError');
        if (!name.value) {
            nameError.textContent = 'Name is required.';
            nameError.style.display = 'block';
        } else if (name.value.length < 3) {
            nameError.textContent = 'Name must be at least 3 characters long.';
            nameError.style.display = 'block';
        } else if (!namePattern.test(name.value)) {
            nameError.textContent = 'Name cannot contain special characters.';
            nameError.style.display = 'block';
        } else {
            nameError.style.display = 'none'; // Hide error if valid
        }
    });

    // Validate Image field
    const image = document.querySelector('input[name="image"]');
    const imageUrlPattern = /^(https?:\/\/)?([a-z0-9-]+\.)+[a-z]{2,6}(\/[^\s]*)?$/i;
    image.addEventListener('input', function() {
        const imageError = document.getElementById('imageError');
        if (!image.value) {
            imageError.textContent = 'Image URL is required.';
            imageError.style.display = 'block';
        } else if (!imageUrlPattern.test(image.value)) {
            imageError.textContent = 'Please enter a valid image URL (e.g., http://example.com).';
            imageError.style.display = 'block';
        } else {
            imageError.style.display = 'none'; // Hide error if valid
        }
    });

    // Validate Price field
    const price = document.querySelector('input[name="price"]');
    const pricePattern = /^\d+(\.\d{1,2})?$/;
    price.addEventListener('input', function() {
        const priceError = document.getElementById('priceError');
        if (!price.value) {
            priceError.textContent = 'Price is required.';
            priceError.style.display = 'block';
        } else if (!pricePattern.test(price.value)) {
            priceError.textContent = 'Price must be a valid number with up to two decimal places (e.g., 10.99).';
            priceError.style.display = 'block';
        } else {
            priceError.style.display = 'none'; // Hide error if valid
        }
    });

    // Validate form fields before submission
    document.getElementById('addProductForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting immediately

        let isValid = true;

        // Validate ID field
        if (!id.value || id.value < 1) {
            document.getElementById('idError').textContent = 'ID must be greater than 0.';
            document.getElementById('idError').style.display = 'block';
            isValid = false;
        }

        // Validate Name field
        if (!name.value) {
            document.getElementById('nameError').textContent = 'Name is required.';
            document.getElementById('nameError').style.display = 'block';
            isValid = false;
        } else if (name.value.length < 3) {
            document.getElementById('nameError').textContent = 'Name must be at least 3 characters long.';
            document.getElementById('nameError').style.display = 'block';
            isValid = false;
        } else if (!namePattern.test(name.value)) {
            document.getElementById('nameError').textContent = 'Name cannot contain special characters.';
            document.getElementById('nameError').style.display = 'block';
            isValid = false;
        }

        // Validate Image field
        if (!image.value) {
            document.getElementById('imageError').textContent = 'Image URL is required.';
            document.getElementById('imageError').style.display = 'block';
            isValid = false;
        } else if (!imageUrlPattern.test(image.value)) {
            document.getElementById('imageError').textContent = 'Please enter a valid image URL (e.g., http://example.com).';
            document.getElementById('imageError').style.display = 'block';
            isValid = false;
        }

        // Validate Price field
        if (!price.value) {
            document.getElementById('priceError').textContent = 'Price is required.';
            document.getElementById('priceError').style.display = 'block';
            isValid = false;
        } else if (!pricePattern.test(price.value)) {
            document.getElementById('priceError').textContent = 'Price must be a valid number with up to two decimal places (e.g., 10.99).';
            document.getElementById('priceError').style.display = 'block';
            isValid = false;
        }

        // If form is valid, submit it
        if (isValid) {
            this.submit(); // Submit the form if valid
        }
    });
});
