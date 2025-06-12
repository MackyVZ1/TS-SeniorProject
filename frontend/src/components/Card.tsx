import type { ReactNode } from "react";
import Flex from "./Flex";
import { colors } from "../theme/theme";

type ThemeColor = keyof typeof colors;

interface Props {
  width?: number | string;
  height?: number | string;
  radius?: number | string;
  color?: ThemeColor;
  shadow?: "xs" | "sm" | "md" | "lg" | "xl" | number;
  className?: string;
  children?: ReactNode;
  style?: React.CSSProperties;
}

function Card({
  width,
  height,
  radius,
  color,
  shadow,
  className,
  children,
  style,
}: Props) {
  const classes: string[] = [];
  const customStyle: React.CSSProperties = {};

  // width & height
  if (width) {
    customStyle.width = typeof width === "number" ? `${width}px` : width;
  }
  if (height) {
    customStyle.height = typeof height === "number" ? `${height}px` : height;
  }

  return <div>Card</div>;
}

export default Card;
