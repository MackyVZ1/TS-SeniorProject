import Button from "../../components/Button";
import Flex from "../../components/Flex";
import Input from "../../components/Input";
import Text from "../../components/Text";
import LogoBackground from "./LogoBackground";

function LoginCard() {
  return (
    <LogoBackground>
      <Flex
        direction="column"
        justifyContent="center"
        className={`w-[340px] p-[20px] rounded-4xl bg-[#A861D4]/80 gap-[20px] shadow-lg shadow-[#7C22B4]
        md:w-[600px] md:h-[480px] md:p-[40px]
        lg:h-[550px]`}
      >
        <Flex direction="column" textAlign="center">
          <Text semibold className={`text-[28px] md:text-[36px]`}>
            .: e-Chart :.
          </Text>
          <Text medium className={`text-[18px] md:text-[28px]`}>
            เข้าสู่ระบบ
          </Text>
        </Flex>
        <Flex direction="column" textAlign="center" className="gap-[16px]">
          <Text medium className={`text-[18px] md:text-[28px]`}>
            ชื่อผู้ใช้
          </Text>
          <Input type="text" />
          <Text medium className={`text-[18px] md:text-[28px]`}>
            รหัสผ่าน
          </Text>
          <Input type="password" />
        </Flex>
        <Flex justifyContent="center">
          <Button type="submit">ลงชื่อเข้าใช้</Button>
        </Flex>
      </Flex>
    </LogoBackground>
  );
}

export default LoginCard;
