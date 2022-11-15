import "../styles/globals.css";
import Head from "next/head";
import type { AppProps } from "next/app";
import SideBar from "../components/shared/nav/sideBar";
import { ChakraProvider } from "@chakra-ui/react";
export default function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <Head>
        <link
          href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap"
          rel="stylesheet"
        />
      </Head>
      <SideBar />
      <ChakraProvider>
        <Component {...pageProps} />
      </ChakraProvider>
    </>
  );
}
