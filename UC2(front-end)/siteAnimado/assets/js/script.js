
window.addEventListener("load", () => {
     
    const video = document.createElement("video");
    video.src = "assets/videos/backgroundVideo.mp4";
    video.autoplay = true;
    video.muted = true;
    video.loop = true;
    video.playsInline = true;
    video.classList.add("myVideo");
    document.querySelector(".index").prepend(video);
});