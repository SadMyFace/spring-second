console.log("boardComment in~~!!");
console.log(bnoVal);

document.getElementById('cmtPostBtn').addEventListener('click', ()=>{
    const cmtText = document.getElementById('cmtText');
    if(cmtText.value == null || cmtText.value == ''){
        alert('댓글을 입력해주세요.');
        cmtText.focus();
        return false;
    }else{
        let cmtData={
            bno: bnoVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText.value
        };
        console.log(cmtData);
        postCommentToServer(cmtData).then(result =>{
            if(result === '1'){
                alert("댓글 등록 성공~!!");
                cmtText.value = "";
            }
            //화면에 뿌리기
            spreadCommentList(cmtData.bno);
        })
    }
})

async function postCommentToServer(cmtData){
    try {
        const url = "/comment/post";
        const config = {
            method:"post",
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        };

        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (error) {
        console.log(error);
    }
}

async function getCommentListFromServer(bno, page){
    try {
        const resp = await fetch("/comment/"+bno+"/"+page);
        const result = await resp.json(); // commentList return
        return result;
    } catch (error) {
        console.log(error);
    }
}

function spreadCommentList(bno, page=1){
    getCommentListFromServer(bno, page).then(result => {
        console.log(result);
        //댓글 모양대로 뿌리기
        const ul = document.getElementById('cmtListArea');
        //댓글을 다시 뿌릴때 기존 값을 삭제X 1page일 경우에만 삭제
        if(page==1){
            ul.innerHTML = '';
        }
        if(result.cmtList.length > 0){
            for(let cvo of result.cmtList){
                let li = `<li class="list-group-item" data-cno="${cvo.cno}" data-writer=${cvo.writer}>`;
                li += `<div class="mb-3">`;
                li += `<div class="fw-bold">${cvo.writer}</div>`;
                li += `${cvo.content}`;
                li += `</div>`;
                li += `<span class="badge text-bg-warning">${cvo.modAt}</span>`;   
                li += `<button type="button" class="btn btn-outline-warning btn-sm mod" data-bs-toggle="modal" data-bs-target="#myModal">수정</button>`;
                li += `<button type="button" class="btn btn-outline-danger btn-sm del">삭제</button>`;
                li += `</li>`;
                ul.innerHTML += li;      
            }
            //더보기 버튼 코드
            let moreBtn = document.getElementById('moreBtn');
            console.log(moreBtn);
            //more 버튼 표시 조건
            if(result.pgvo.pageNo < result.endPage){
                moreBtn.style.visibility = 'visible'; //버튼 표시
                moreBtn.dataset.page = page + 1;
            }else{
                moreBtn.style.visibility = 'hidden'; //버튼 숨김
            }
        }else{
            let li = `<li class="list-group-item">Comment List Empty</li>`;
            ul.innerHTML = li;
        }
    })
}

document.addEventListener('click', (e)=>{
    console.log(e.target);
    if(e.target.id == 'moreBtn'){
        let page = parseInt(e.target.dataset.page);
        spreadCommentList(bnoVal, page);
    }else if(e.target.classList.contains('mod')){
        let li = e.target.closest('li');
        let cmtText = li.querySelector('.fw-bold').nextSibling; //한 부모 안에서 같은(다음) 형제를 찾기

        //모달창에 기존 댓글 내용을 반영 (수정하기 편하게...)
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;

        //수정 => cno, writer, content 을 위한 cno, writer data- 로 달기
        document.getElementById('cmtModBtn').setAttribute("data-cno", li.dataset.cno);
        document.getElementById('cmtModBtn').setAttribute("data-writer", li.dataset.writer);
    }else if(e.target.id == 'cmtModBtn'){
        let cmtDataMod={
            cno: e.target.dataset.cno,
            writer: e.target.dataset.writer,
            content: document.getElementById('cmtTextMod').value
        };
        console.log(cmtDataMod);
        //비동기 보내기
        editCommentToServer(cmtDataMod).then(result => {
            if(result == "1"){ //수정 성공
                //모달창을 닫기
                document.querySelector('.btn-close').click();
            }else{
                alert("수정 실패");
                document.querySelector('.btn-close').click();
            }
            //수정된 댓글 뿌리기 page = 1
            spreadCommentList(bnoVal);
        })
    }else if(e.target.classList.contains('del')){
        let li = e.target.closest('li');
        let cnoVal = li.dataset.cno;
        console.log(cnoVal);

        //비동기 보내기
        deleteCommentToServer(cnoVal).then(result => {
            if(result == "1"){
                alert("댓글 삭제 성공");
            }else{
                alert("댓글 삭제 실패");
            }
            spreadCommentList(bnoVal);
        })

    }
});

async function editCommentToServer(cmtDataMod){
    try {
        const url = '/comment/edit';
        const config = {
            method: 'put',
            headers: {
                'content-type':'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtDataMod)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteCommentToServer(cnoVal){
    try {
        const url = '/comment/delete/'+cnoVal;
        const config = {
            method: 'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}