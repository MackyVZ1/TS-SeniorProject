import Flex from "@/components/Flex";
import Patienttable from "./Patienttable";

function Searchpatient() {
  return (
    <Flex direction="column" className=" gap-[42px] w-full">
      <Patienttable />
    </Flex>
  );
}

export default Searchpatient;
