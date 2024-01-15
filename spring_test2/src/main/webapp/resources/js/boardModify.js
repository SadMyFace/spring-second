console.log("boardModify in~~!!");

async function deleteImageFromServer(uuid){
    const url = "/board/deleteImage/" + uuid;
    const config = {
        method: 'delete'        
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
}

document.addEventListener('click', (e)=>{
    console.log(e.target);

    if(e.target.classList.contains('file-x')){
        let fileUuid = e.target.dataset.uuid;
        console.log(fileUuid);
        
        deleteImageFromServer(fileUuid).then(result => {
            if(result == "1"){
                e.target.closest('li').remove();
                location.reload();
            }else{
                alert("이미지 삭제 실패!");
            }
        })

    }
})