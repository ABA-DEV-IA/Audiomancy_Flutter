""" Module providing the AI agent needed to analyze the user prompt """

from langchain.agents import create_agent
from app.services.ai.tools.web_search import web_search
from app.services.ai.utils.azure_openai import get_llm

# Charger le prompt système
with open("app/services/ai/utils/system_prompt.txt", "r", encoding="utf-8") as f:
    system_prompt = f.read()


class AIAgent:
    """
    Class defining the AI Agent.
    """
    def __init__(self):
        """
        Initializes the AI_Agent class.
        """
        self.llm = get_llm()

        # Les outils doivent être décorés avec @tool
        self.tools = [web_search]

        # Création de l'agent (sans verbose)
        self.agent = create_agent(
            model=self.llm,
            tools=self.tools,
            system_prompt=system_prompt
        )

    def run(self, prompt: str) -> str:
        """
        Runs the AI agent with a given user prompt.

        Args:
            prompt (str): The user's prompt.

        Returns:
            str: The generated output, or empty string if none.
        """
        try:
            result = self.agent.invoke({"messages": [{"role": "user", "content": prompt}]})
            return result.get("text", "")
        except Exception as e:
            print(f"An error occurred: {e}")
            return ""
