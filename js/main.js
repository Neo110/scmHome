/**
* Template Name: FlexStart
* Updated: Jun 19 2023 with Bootstrap v5.3.0
* Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
(function () {
    "use strict";

    /**
     * Easy selector helper function
     */
    const select = (el, all = false) => {
        el = el.trim()
        if (all) {
            return [...document.querySelectorAll(el)]
        } else {
            return document.querySelector(el)
        }
    }

    /**
     * Easy event listener function
     */
    const on = (type, el, listener, all = false) => {
        if (all) {
            select(el, all).forEach(e => e.addEventListener(type, listener))
        } else {
            select(el, all).addEventListener(type, listener)
        }
    }

    /**
     * Easy on scroll event listener 
     */
    const onscroll = (el, listener) => {
        el.addEventListener('scroll', listener)
    }

    /**
     * Navbar links active state on scroll
     */
    let navbarlinks = select('#navbar .scrollto', true)
    const navbarlinksActive = () => {
        let position = window.scrollY + 200
        navbarlinks.forEach(navbarlink => {
            if (!navbarlink.hash) return
            let section = select(navbarlink.hash)
            if (!section) return
            if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
                navbarlink.classList.add('active')
            } else {
                navbarlink.classList.remove('active')
            }
        })
    }
    window.addEventListener('load', navbarlinksActive)
    onscroll(document, navbarlinksActive)

    /**
     * Scrolls to an element with header offset
     */
    const scrollto = (el) => {
        let header = select('#header')
        let offset = header.offsetHeight

        if (!header.classList.contains('header-scrolled')) {
            offset -= 10
        }

        let elementPos = select(el).offsetTop
        window.scrollTo({
            top: elementPos - offset,
            behavior: 'smooth'
        })
    }

    /**
     * Toggle .header-scrolled class to #header when page is scrolled
     */
    let selectHeader = select('#header')
    if (selectHeader) {
        const headerScrolled = () => {
            if (window.scrollY > 100) {
                selectHeader.classList.add('header-scrolled')
            } else {
                selectHeader.classList.remove('header-scrolled')
            }
        }
        window.addEventListener('load', headerScrolled)
        onscroll(document, headerScrolled)
    }

    /**
     * Back to top button
     */
    let backtotop = select('.back-to-top')
    if (backtotop) {
        const toggleBacktotop = () => {
            if (window.scrollY > 100) {
                backtotop.classList.add('active')
            } else {
                backtotop.classList.remove('active')
            }
        }
        window.addEventListener('load', toggleBacktotop)
        onscroll(document, toggleBacktotop)
    }

    /**
     * Mobile nav toggle
     */
    // on('click', '.mobile-nav-toggle', function(e) {
    //   select('#navbar').classList.toggle('navbar-mobile')
    //   this.classList.toggle('bi-list')
    //   this.classList.toggle('bi-x')
    // })

    /**
     * Mobile nav dropdowns activate
     */
    // on('click', '.navbar .dropdown > a', function(e) {
    //   if (select('#navbar').classList.contains('navbar-mobile')) {
    //     e.preventDefault()
    //     this.nextElementSibling.classList.toggle('dropdown-active')
    //   }
    // }, true)

    /**
     * Scrool with ofset on links with a class name .scrollto
     */
    // on('click', '.scrollto', function(e) {
    //   if (select(this.hash)) {
    //     e.preventDefault()

    //     let navbar = select('#navbar')
    //     if (navbar.classList.contains('navbar-mobile')) {
    //       navbar.classList.remove('navbar-mobile')
    //       let navbarToggle = select('.mobile-nav-toggle')
    //       navbarToggle.classList.toggle('bi-list')
    //       navbarToggle.classList.toggle('bi-x')
    //     }
    //     scrollto(this.hash)
    //   }
    // }, true)

    /**
     * Scroll with ofset on page load with hash links in the url
     */
    // window.addEventListener('load', () => {
    //     if (window.location.hash) {
    //         if (select(window.location.hash)) {
    //             scrollto(window.location.hash)
    //         }
    //     }
    // });

    /**
     * Clients Slider
     */
    new Swiper('.clients-slider', {
        speed: 400,
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        slidesPerView: 'auto',
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            320: {
                slidesPerView: 2,
                spaceBetween: 40
            },
            480: {
                slidesPerView: 3,
                spaceBetween: 60
            },
            640: {
                slidesPerView: 4,
                spaceBetween: 80
            },
            992: {
                slidesPerView: 6,
                spaceBetween: 120
            }
        }
    });

    /**
     * Porfolio isotope and filter
     */
    window.addEventListener('load', () => {
        let portfolioContainer = select('.portfolio-container');
        if (portfolioContainer) {
            let portfolioIsotope = new Isotope(portfolioContainer, {
                itemSelector: '.portfolio-item',
                layoutMode: 'fitRows'
            });

            let portfolioFilters = select('#portfolio-flters li', true);

            on('click', '#portfolio-flters li', function (e) {
                e.preventDefault();
                portfolioFilters.forEach(function (el) {
                    el.classList.remove('filter-active');
                });
                this.classList.add('filter-active');

                portfolioIsotope.arrange({
                    filter: this.getAttribute('data-filter')
                });
                aos_init();
            }, true);
        }


    });

    /**
     * Initiate portfolio lightbox 
     */
    const portfolioLightbox = GLightbox({
        selector: '.portfokio-lightbox'
    });

    /**
     * Portfolio details slider
     */
    new Swiper('.portfolio-details-slider', {
        speed: 400,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true
        }
    });

    /**
     * Testimonials slider
     */
    new Swiper('.testimonials-slider', {
        speed: 600,
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        slidesPerView: 'auto',
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            320: {
                slidesPerView: 1,
                spaceBetween: 40
            },

            1200: {
                slidesPerView: 3,
            }
        }
    });

    /**
     * Animation on scroll
     */
    function aos_init() {
        AOS.init({
            duration: 1000,
            easing: "ease-in-out",
            once: true,
            mirror: false
        });
    }

    // window.addEventListener('hashchange', function(event) {
    //     console.log(" hashchange", hashchange);
    //     var hash = window.location.hash;
    //     if (hash) {
    //         console.log(" hash", hash);
    //         var element = document.getElementById(hash);
    //         if (element) {
    //             console.log(" element", element);
    //             element.scrollIntoView();
    //         }
    //     }
    // });
    window.addEventListener('load', () => {
        aos_init();
        fetch('https://scm.chusen.tech/version.json')
            .then(response => {
                // 检查网络请求是否成功
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                // 将响应转换为 JSON 格式
                return response.json();
            })
            .then(data => {
                // 将data.version 写入到界面中通过id
                document.getElementById("version").innerHTML = "最新版本 " + data.version;
                var packagesHtml = "";
                // 解析packages 生成 table
                 
             
                // var list = data.packages[0].list;
                // console.log(" list", list.length);
                
                // for (var i = 0; i < list.length; i++) {
                //     packagesHtml += "<tr>";
                //     packagesHtml += "<th scope='row'>";
                //     packagesHtml += "  <button type='button'  url='" + list[i].url + "' class='link-button btn btn-sm btn-secondary btn-icon rounded-pill'>";
                //     packagesHtml += "    <span class='btn-inner--icon'><i class='far fa-download'></i></span>";
                //     packagesHtml += "    <span class='btn-inner--text'>Download</span>";
                //     packagesHtml += "  </button>";
                //     packagesHtml += "</th>";
                //     packagesHtml += " <td class='order'>";
                //     packagesHtml += "  <span class='h6 text-sm font-weight-bold mb-0'>" + list[i].label + "</span>";
                //     packagesHtml += "  <span class='d-block text-sm text-muted text-label'>" + list[i].subLabel + "</span>";
                //     packagesHtml += " </td>";
                //     //   packagesHtml += " <td>";
                //     //   packagesHtml += "  <span class='client'>"+list[i].version+"</span>";
                //     //   packagesHtml += "</td>";
                //     packagesHtml += "<td>";
                //     packagesHtml += "  <span class='taxes text-sm mb-0 text-label'>" + list[i].description + "</span>";
                //     packagesHtml += "</td> ";
                //     packagesHtml += "</tr>  "
                //     if(i != list.length)
                //     packagesHtml += "<tr class='table-divider'></tr>";
                // }
           
                // // 将packagesHtml 替换到界面中通过id
                // document.getElementById("packages").innerHTML = packagesHtml;
                // //添加link-button 点击后没有触发事件？
                // on('click', '.link-button', function (e) {
                //     //   点击对应连接进行下载
                //     var url = this.getAttribute('url');
                //     // url 弹出心窗口下载
                //     window.open(url);
                // }, true);

                // // document.getElementById("loading-container").style.display = "none";
                // // // Show the content
                // // document.getElementById("content").style.display = "block";
  
                for(var osIndex =0 ; data.packages.length ; osIndex++){
                    var packagesOther = "";
                    var osType  = data.packages[osIndex].os;
                    var listLinux = data.packages[osIndex].list;
                    console.log(" listLinux", listLinux.length);
                    
                    for (var i = 0; i < listLinux.length; i++) {
                        packagesOther += "<tr>";
                        packagesOther += "<th scope='row'>";
                        packagesOther += "  <button type='button'  url='" + listLinux[i].url + "' class='link-button btn btn-sm btn-secondary btn-icon rounded-pill'>";
                        packagesOther += "    <span class='btn-inner--icon'><i class='far fa-download'></i></span>";
                        packagesOther += "    <span class='btn-inner--text'>Download</span>";
                        packagesOther += "  </button>";
                        packagesOther += "</th>";
                        packagesOther += " <td class='order'>";
                        packagesOther += "  <span class='h6 text-sm font-weight-bold mb-0'>" + listLinux[i].label + "</span>";
                        packagesOther += "  <span class='d-block text-sm text-muted text-label'>" + listLinux[i].subLabel + "</span>";
                        packagesOther += " </td>";
                        //   packagesHtml += " <td>";
                        //   packagesHtml += "  <span class='client'>"+list[i].version+"</span>";
                        //   packagesHtml += "</td>";
                        packagesOther += "<td>";
                        packagesOther += "  <span class='taxes text-sm mb-0 text-label'>" + listLinux[i].description + "</span>";
                        packagesOther += "</td> ";
                        packagesOther += "</tr>  "
                        if(i != listLinux.length)
                        packagesOther += "<tr class='table-divider'></tr>";
                    }
            
                    // 将packagesOther 替换到界面中通过id
                    document.getElementById("packages-"+osType).innerHTML = packagesOther;

                    //添加link-button 点击后没有触发事件？
                    on('click', '.link-button', function (e) {
                        //   点击对应连接进行下载
                        var url = this.getAttribute('url');
                        // url 弹出心窗口下载
                        window.open(url);
                    }, true);
                }
                document.getElementById("loading-container").style.display = "none";
                // Show the content
                document.getElementById("content").style.display = "block";
 

            });

            // 引入延迟，确保在内容加载后执行滚动
            setTimeout(function() {
            var desiredElement = document.getElementById(window.location.hash.replace("#", ""));
            if (desiredElement) {
                desiredElement.scrollIntoView({
                    behavior: 'smooth', // 你可以根据需要将此项更改为 'auto' 以获得即时滚动
                });
            }
            console.log(" window.location.hash", window.location.hash);
            // 在滚动后设置锚点
            window.location.hash = window.location.hash;
            }, 1000); // 500 毫秒的延迟，可以根据需要调整
    });



    on('click', '.link-button', function (e) {
        //   点击对应连接进行下载
        var url = this.getAttribute('url');
        console.log(" url" ,url);

    }, true);

    /**
     * Initiate Pure Counter 
     */
    new PureCounter();

})();