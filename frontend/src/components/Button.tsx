import type { ReactNode } from "react";
import { colors } from "../theme/theme";

type ThemeColor = keyof typeof colors;

interface Props {
  type?: "submit" | "reset" | "button";
  backgroundColor?: ThemeColor;
  className?: string;
  style?: React.CSSProperties;
  children?: ReactNode;
}

function Button({ type, backgroundColor, className, style, children }: Props) {
  const classes: string[] = [
    `bg-[#7C22B4] w-[140px] p-4 rounded-3xl transition-all transform duration-300 text-white text-base
    hover:cursor-pointer hover:bg-[#7C22B4]/70
    md:w-[180px] md:p-6 md:rounded-4xl md:text-[24px]`,
  ];
  const customStyle: React.CSSProperties = {};

  // backgroundColor
  if (backgroundColor) {
    if (
      typeof backgroundColor === "string" &&
      colors.hasOwnProperty(backgroundColor)
    ) {
      customStyle.backgroundColor = colors[backgroundColor as ThemeColor];
    } else if (typeof backgroundColor === "string") {
      customStyle.backgroundColor = backgroundColor;
    }
  }
  const allClasses = classes.join(" ") + (className ? ` ${className}` : "");
  return (
    <button
      type={type}
      className={allClasses}
      style={{ ...customStyle, ...style }}
    >
      {children}
    </button>
  );
}

export default Button;
