import type { ReactNode } from "react";
import { colors } from "../theme/theme";

type ThemeColor = keyof typeof colors;

interface Props {
  type?: "submit" | "reset" | "button";
  backgroundColor?: ThemeColor;
  className?: string;
  style?: React.CSSProperties;
  children?: ReactNode;
  onClick?: (event: React.MouseEvent<HTMLButtonElement>) => void;
}

function Button({
  type,
  backgroundColor,
  className,
  style,
  children,
  onClick,
}: Props) {
  const classes: string[] = [
    `bg-[#7C22B4] px-8 py-4 rounded-2xl transition-all transform duration-300 text-white text-base
    hover:cursor-pointer hover:bg-[#7C22B4]/70
    `,
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
      onClick={onClick}
    >
      {children}
    </button>
  );
}

export default Button;
