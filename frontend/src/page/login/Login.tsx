import DentLogo from "./component/DentLogo";
import Flex from "../../components/Flex";
import LoginCard from "./component/LoginCard";
// import Background from "./Background";
function Login() {
  return (
    // <Background>
    <Flex
      justifyContent="center"
      alignItems="center"
      direction="column"
      className="gap-[16px]  px-[10px] md:gap-[36px]"
    >
      <DentLogo />
      <LoginCard />
    </Flex>
    // </Background>
  );
}

export default Login;
