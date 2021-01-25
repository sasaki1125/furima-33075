window.addEventListener('load', () => {
  
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  const profits = document.getElementById("profit");
  profits.innerHTML = Math.floor(inputValue * 0.9)

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  })
  

  
});