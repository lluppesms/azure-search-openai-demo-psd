import { Example } from "./Example";

import styles from "./Example.module.css";

export type ExampleModel = {
    text: string;
    value: string;
};

const EXAMPLES: ExampleModel[] = [
    {
        text: "What kinds of cartridges can I use in an SA-2600 respirator?",
        value: "What kinds of cartridges can I use in an SA-2600 respirator?"
    },
    {
        text: "What does a 3M surgical mask protect me from?",
        value: "What does a 3M surgical mask protect me from?"
    },
    {
        text: "How do I don a respirator?",
        value: "How do I don a respirator?"
    }
];

interface Props {
    onExampleClicked: (value: string) => void;
}

export const ExampleList = ({ onExampleClicked }: Props) => {
    return (
        <ul className={styles.examplesNavList}>
            {EXAMPLES.map((x, i) => (
                <li key={i}>
                    <Example text={x.text} value={x.value} onClick={onExampleClicked} />
                </li>
            ))}
        </ul>
    );
};
