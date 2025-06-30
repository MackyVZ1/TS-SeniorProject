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
  disabled?: boolean;
}

function Button({
  type,
  backgroundColor,
  className,
  style,
  children,
  onClick,
  disabled,
}: Props) {
  const classes: string[] = [
    `flex justify-center items-center bg-[#7C22B4] px-3 py-4 rounded-2xl transition-all transform duration-300 text-white text-base gap-2 
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
      disabled={disabled}
    >
      {children}
    </button>
  );
}

export default Button;
