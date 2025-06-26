import { useNavigate } from "react-router-dom";
import Button from "../../../components/Button";
import Flex from "../../../components/Flex";
import Input from "../../../components/Input";
import Text from "../../../components/Text";
import LogoBackground from "./LogoBackground";
import { useState } from "react";
import axios from "axios";
import { SuccessModal, ErrorModal } from "../../../components/Modal";

function LoginCard() {
  const nav = useNavigate();

  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [modalOn, setModalOn] = useState<boolean>(false);
  const [error, setError] = useState<string>("");

  const handleSignup = async () => {
    try {
      const {
        data: { data },
      } = await axios.post("http://localhost:3000/api/auth/login", {
        users: username,
        passw: password,
      });

      if (data) {
        const { token, user } = data;
        if (token && user) {
          sessionStorage.setItem("token", token);
          sessionStorage.setItem("users", user.users);
          sessionStorage.setItem("roleName", user.roleName);
          setModalOn(true);

          setTimeout(() => {
            setModalOn(false);
            nav("/home");
          }, 1000);
        }
      }
    } catch (e: any) {
      let errorMessage = e?.response?.data?.message;
      console.error(errorMessage);
      if (errorMessage == "Username and password should not be empty.") {
        errorMessage = "กรุณากรอกชื่อผู้ใช้\nและรหัสผ่าน";
        setError(errorMessage);
      } else if (errorMessage == "Username should not be empty.") {
        errorMessage = "กรุณากรอกชื่อผู้ใช้";
        setError(errorMessage);
      } else if (errorMessage == "Password should not be empty.") {
        errorMessage = "กรุณากรอกรหัสผ่าน";
        setError(errorMessage);
      } else if (errorMessage == "User not found.") {
        errorMessage = "ไม่พบผู้ใช้";
        setError(errorMessage);
      } else errorMessage = "เซิร์ฟเวอร์ขัดข้อง";
      setError(errorMessage);
      setModalOn(true);

      setTimeout(() => {
        setError("");
        setModalOn(false);
      }, 2000);
    }
  };

  return (
    <>
      <LogoBackground>
        <Flex
          direction="column"
          justifyContent="center"
          className={`w-[340px] p-[20px] rounded-4xl bg-[#A861D4]/80 gap-[20px] shadow-lg shadow-[#7C22B4]
        md:w-[600px] md:h-[480px] md:p-[40px]
        lg:h-[550px]`}
        >
          <Flex direction="column" textAlign="center">
            <Text semibold className={`text-white text-[28px] md:text-[36px]`}>
              .: e-Chart :.
            </Text>
            <Text medium className={`text-white  text-[18px] md:text-[28px]`}>
              เข้าสู่ระบบ
            </Text>
          </Flex>
          <Flex direction="column" textAlign="center" className="gap-[16px]">
            <Text medium className={`text-white  text-[18px] md:text-[28px]`}>
              ชื่อผู้ใช้
            </Text>
            <Input
              name="username"
              autocomplete="username"
              value={username}
              onChange={setUsername}
              placeholder="ชื่อผู้ใช้"
              type="text"
              required
            />
            <Text medium className={`text-white  text-[18px] md:text-[28px]`}>
              รหัสผ่าน
            </Text>
            <Input
              name="password"
              autocomplete="current-password"
              value={password}
              onChange={setPassword}
              placeholder="รหัสผ่าน"
              type="password"
              required
            />
          </Flex>
          <Flex justifyContent="center">
            <Button type="submit" onClick={handleSignup}>
              <Text medium className="text-white text-[16px] lg:text-[20px]">
                ลงชื่อเข้าใช้
              </Text>
            </Button>
          </Flex>
        </Flex>
      </LogoBackground>
      {modalOn && !error && (
        <SuccessModal message="เข้าสู่ระบบสำเร็จ" isVisible={modalOn} />
      )}
      {modalOn && !!error && <ErrorModal message={error} isVisible={modalOn} />}
    </>
  );
}

export default LoginCard;
