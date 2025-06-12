import backgroundImg from "../../assets/png/login_background.png";

import type { ReactNode } from "react";
import Flex from "../../components/Flex";

interface Props {
  children: ReactNode;
}
function Background({ children }: Props) {
  return (
    <Flex
      justifyContent="center"
      className="relative w-screen h-screen overflow-hidden "
    >
      <Flex
        className="w-screen h-screen absolute z-0"
        justifyContent="center"
        alignItems="center"
      >
        <img
          src={backgroundImg}
          alt="background"
          className="w-screen h-screen object-cover"
        />
      </Flex>

      <div className="z-10">{children}</div>
    </Flex>
  );
}

export default Background;
