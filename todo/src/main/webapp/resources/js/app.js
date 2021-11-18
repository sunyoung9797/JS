/*	"petSelect"    ->[ ]
	리턴결과 건수만큼 반복 실행
		-petTemplated 클래스 태그를 복사
		-title, breed, age, location등 수정
		-petsRow 아이디를 가진 태그에 추가
 */
(async function Pet1() {
	try {
		var response = await fetch("petSelect");
		var result = await response.json();
		makelist(result);	
	} catch(e) {
		console.log(e.message)
	}
})().then(Pet2);

	function makelist(result) {
	var pet = document.getElementById("petTemplate");
	var petRow = document.getElementById('petsRow');

	for(let info of result){		
		//js					
		pet.getElementsByClassName("panel-title")[0].innerHTML = info.name;
		pet.getElementsByClassName("img-center")[0].setAttribute("src", info.picture);
		pet.getElementsByClassName("pet-breed")[0].innerHTML = info.breed;
		pet.getElementsByClassName("pet-age")[0].innerHTML = info.age;
		pet.getElementsByClassName("pet-location")[0].innerHTML = info.location;
		
		petRow.appendChild(pet.firstElementChild.cloneNode(true));	
		}
	}	

async function Pet2() {
	try {
		let response = await fetch("adoptSelect");
		let data = await response.json();
		adoptSelect(data);	
	} catch(e) {
		console.log(e.message)
	}
}

	function adoptSelect(data){
		for(i=0;i<data.length;i++) {
		$('.panel-pet').eq(data[i].id)        //id에 해당하는 pet 검색
					   .find('button')		    //버튼 태그 검색
					   .text('success')			//버튼의 태그내용 변경
					   .attr('disabled',true);	//버튼 비활성화
		}
	}
		
/*fetch("petSelect")
.then(response => response.json())
.then(makelist)
.then(adoptSelect);

	function makelist(result) {
	var pet = document.getElementById("petTemplate");
	var petRow = document.getElementById('petsRow');
	for(let info of result){		
		//js
				
		pet.getElementsByClassName("panel-title")[0].innerHTML = info.name;
		pet.getElementsByClassName("img-center")[0].setAttribute("src", info.picture) ;
		pet.getElementsByClassName("pet-breed")[0].innerHTML = info.breed;
		pet.getElementsByClassName("pet-age")[0].innerHTML = info.age;
		pet.getElementsByClassName("pet-location")[0].innerHTML = info.location;
		
		
		petRow.appendChild(pet.firstElementChild.cloneNode(true));	
		
		//jquery
		
		var pet = $('#petTemplate');
		
		pet.find(".panel-title").html(info.name)
		pet.find(".img-center").attr("src",info.picture)
		pet.find(".pet-breed").html(info.breed)
		pet.find(".pet-age").html(info.age)
		pet.find(".pet-location").html(info.location)
		
		$("#petsRow").append(pet.html());
		 
		}
	}	
			
	function adoptSelect(){
		fetch("adoptSelect")
		.then(response => response.json())
		.then(data => {	
			for(i=0;i<data.length;i++) {
			$('.panel-pet').eq(data[i].id)        //id에 해당하는 pet 검색
						   .find('button')		    //버튼 태그 검색
						   .text('success')			//버튼의 태그내용 변경
						   .attr('disabled',true);	//버튼 비활성화
			}
		
		})
		
	}
*/
