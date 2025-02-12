import {useEffect, useState} from "react";
import * as React from "react";
import {SideNavigation, AppHeaderSection, PageFooter} from '@akello/react'
import {top_nav_buttons, bottom_nav_buttons, LogoButton } from "../side_nav_buttons";


interface PageContainerProps {
    children: React.ReactNode;
    title: string
}

const PageContainer:React.FC<PageContainerProps> = ({children, title}) => {
    const local_theme = localStorage.getItem('theme')
    const [theme, setTheme] = useState(local_theme)

    useEffect(() => {
        const html = document.querySelector('html');
        if(html && theme) {
            html.setAttribute('data-theme', theme)
        }
        localStorage.setItem('theme', theme ? theme : '')
    }, [theme]);


    return (
        <>
            <div className={"flex flex-col"}>
                <SideNavigation
                    logo={<LogoButton />}
                    top_navigation={top_nav_buttons}
                    bottom_navigation={bottom_nav_buttons}
                />
                <div className="pl-20 h-full">
                    <>
                        <AppHeaderSection title={title} />
                        <div className={"px-2 py-4 "}>
                            {children}
                            <PageFooter
                                terms_of_service_link={"/terms.html"}
                                privacy_policy_link={"/privacy.html"}
                            />
                        </div>
                    </>
                </div>
            </div>
        </>
    )
}

export default PageContainer