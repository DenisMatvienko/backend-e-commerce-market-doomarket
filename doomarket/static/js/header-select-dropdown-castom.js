// Контейнер с селектом
const selectAllElements = document.querySelectorAll("[data-select]");

selectAllElements.forEach(function(item){
	item.addEventListener("click", function(){
		const realSelect = this.nextElementSibling;
		
		// Если кликнули по пунктам в дропдауне			
		if (event.target.hasAttribute("data-select-item")){
			//Нашли заголовок у дропдауна и записали в его текстовое наполнение значение из data атрибута data-select-item
			let itemTitle = event.target.getAttribute("data-select-item")
			this.querySelector("[data-select-title]").textContent = event.target.getAttribute("data-select-item");

			// Cкрываем дропдаун
			this.querySelector(".header-select__dropdown").classList.toggle("hidden");

			// event.target.closest("[data-select]").querySelector(".header-select__dropdown").classList.toggle("hidden");


			// Связка с реальным селектом
			// У реального слекта изменяем значение value
			if (realSelect) {
				realSelect.value = itemTitle;
			}
		} else {
		// Если кликнули по заголовку в дропдауне -скрываем или открываем дропдаун
		this.querySelector(".header-select__dropdown").classList.toggle("hidden");
		}
	})
})