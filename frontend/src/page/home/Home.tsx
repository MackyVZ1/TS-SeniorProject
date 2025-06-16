import Flex from "../../components/Flex";
import Feature from "./component/features/Feature";
import Header from "./component/header/Header";

function Home() {
  return (
    <Flex direction="column" className="lg:flex-row">
      <Header />
      <Feature />
    </Flex>
  );
}

export default Home;
