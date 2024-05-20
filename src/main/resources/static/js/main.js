// 문서가 로드된 후 실행
document.addEventListener('DOMContentLoaded', (event) => {
    const loginLink = document.querySelector('.login-link');
    const lyMyArea = document.querySelector('.lyMyArea');

    // 마우스 오버 이벤트 리스너 추가
    loginLink.addEventListener('mouseover', () => {
        lyMyArea.style.display = 'block';
    });

    // 마우스 아웃 이벤트 리스너 추가
    loginLink.addEventListener('mouseout', () => {
        lyMyArea.style.display = 'none';
    });
});