let basket={
	cartCount : 0,
	cartTotal : 0,
	
	cartList : function() {
		fetch("../cartSelectList")
		.then(response => response.json())
		.then(result => {
			for(let info of result) {
				var cartTpl = document.getElementById("template");
				var basket = document.getElementById('basket');
				
				cartTpl.getElementsByClassName('pname')[0].innerHTML = info.product_nm;
				//cartTpl.getElementsByClassName('p_price')[0].value = info.price;
				cartTpl.getElementsByClassName('basketprice')[0].innerHTML = info.price+'원';
				cartTpl.getElementsByClassName('p_num')[0].value = info.qty;
				cartTpl.getElementsByClassName('abutton')[0].setAttribute("data-no",info.no);
				
				basket.appendChild(cartTpl.firstElementChild.cloneNode(true));
			}
		});
	},
	
	delCheckedItem : function() {
		
	},
	
	delAllItem : function() {
		fetch("../cartDeleteAll")
		.then(() => {
			let data = document.querySelectorAll(".data");
			for(i=0;i<data.length;i++) {
				da = data[i]
				da.remove();
			}
		})
		this.reClac()
	},
	
	delItem : function() {
		let no = event.target.getAttribute('data-no');
		console.log(no);
		let url ="../cartDelete?no="+no;
		fetch(url)
		.then(response => response.json())
		.then(
			//선택한 버튼의 상품을 삭제.. 버튼.closest(".row").remove();
			document.querySelector(".abutton").closest(".row").remove()
		)
		this.reClac()
	},
	
	reClac: function() {
		//수량, 금액 합계 계산
		//합계 자리에 출력
	},
	
	changePNum : function() {
		
	}
	
};

basket.cartList();